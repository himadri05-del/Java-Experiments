package com.shopsphere.controller;
import com.shopsphere.model.*;import com.shopsphere.util.DB;import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.IOException;import java.math.BigDecimal;import java.sql.*;import java.util.*;
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
 @SuppressWarnings("unchecked") protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
  Map<Integer,CartItem> cart=(Map<Integer,CartItem>)req.getSession().getAttribute("cart");if(cart==null||cart.isEmpty()){res.sendRedirect(req.getContextPath()+"/cart");return;}BigDecimal total=BigDecimal.ZERO;for(CartItem i:cart.values())total=total.add(i.getSubtotal());req.setAttribute("cartTotal",total);req.getRequestDispatcher("/checkout.jsp").forward(req,res);
 }
 @SuppressWarnings("unchecked") protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
  HttpSession session=req.getSession();Map<Integer,CartItem> cart=(Map<Integer,CartItem>)session.getAttribute("cart");if(cart==null||cart.isEmpty()){res.sendRedirect(req.getContextPath()+"/cart");return;}
  String name=req.getParameter("name"),email=req.getParameter("email"),address=req.getParameter("address"),city=req.getParameter("city"),pin=req.getParameter("pincode");
  if(blank(name)||blank(email)||blank(address)||blank(city)||blank(pin)){session.setAttribute("error","Please complete every delivery field.");res.sendRedirect(req.getContextPath()+"/checkout");return;}
  BigDecimal total=BigDecimal.ZERO;for(CartItem i:cart.values())total=total.add(i.getSubtotal());
  Connection c=null;
  try{c=DB.getConnection();c.setAutoCommit(false);
   try(PreparedStatement s=c.prepareStatement("INSERT INTO orders(customer_name,email,address_line,city,pincode,total_amount,payment_method,payment_status,order_status) VALUES(?,?,?,?,?,?,'Cash on Delivery','PENDING','PLACED')",Statement.RETURN_GENERATED_KEYS)){
    s.setString(1,name.trim());s.setString(2,email.trim());s.setString(3,address.trim());s.setString(4,city.trim());s.setString(5,pin.trim());s.setBigDecimal(6,total);s.executeUpdate();
    try(ResultSet keys=s.getGeneratedKeys()){keys.next();int orderId=keys.getInt(1);
     try(PreparedStatement item=c.prepareStatement("INSERT INTO order_items(order_id,product_id,product_name,quantity,price) VALUES(?,?,?,?,?)");PreparedStatement stock=c.prepareStatement("UPDATE products SET stock=stock-? WHERE product_id=? AND stock>=?")){
      for(CartItem ci:cart.values()){item.setInt(1,orderId);item.setInt(2,ci.getProduct().getProductId());item.setString(3,ci.getProduct().getName());item.setInt(4,ci.getQuantity());item.setBigDecimal(5,ci.getProduct().getSalePrice());item.addBatch();stock.setInt(1,ci.getQuantity());stock.setInt(2,ci.getProduct().getProductId());stock.setInt(3,ci.getQuantity());stock.addBatch();}
      int[] stockResult=stock.executeBatch();for(int n:stockResult)if(n==0)throw new SQLException("Stock changed");item.executeBatch();c.commit();session.setAttribute("orderId",orderId);
     }
    }
   }
   session.removeAttribute("cart");res.sendRedirect(req.getContextPath()+"/order-success");
  }catch(Exception e){if(c!=null)try{c.rollback();}catch(SQLException ignored){}session.setAttribute("error","We couldn't place the order. Please check stock and database, then try again.");res.sendRedirect(req.getContextPath()+"/checkout");}
  finally{if(c!=null)try{c.close();}catch(SQLException ignored){}}
 }
 private boolean blank(String s){return s==null||s.trim().isEmpty();}
}
