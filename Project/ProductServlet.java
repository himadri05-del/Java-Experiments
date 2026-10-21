package com.shopsphere.controller;
import com.shopsphere.dao.ProductDAO;import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.IOException;import java.sql.SQLException;
@WebServlet("/products")
public class ProductServlet extends HttpServlet {
 protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
  try{ProductDAO dao=new ProductDAO();req.setAttribute("products",dao.findAll(req.getParameter("q"),req.getParameter("category")));req.setAttribute("categories",dao.categories());req.setAttribute("search",req.getParameter("q")==null?"":req.getParameter("q"));req.setAttribute("selectedCategory",req.getParameter("category")==null?"All":req.getParameter("category"));req.getRequestDispatcher("/products.jsp").forward(req,res);}
  catch(SQLException e){throw new ServletException("Could not load products. Check MySQL setup.",e);}
 }
}
