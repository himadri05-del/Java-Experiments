
package com.shopsphere.controller;

import com.shopsphere.dao.ProductDAO;
import com.shopsphere.model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));

                // FIX: findById returns a Product, not a Servlet
                Product p = new ProductDAO().findById(id);

                if (p != null && p.getStock() > 0) {
                    CartItem old = cart.get(id);

                    if (old == null) {
                        cart.put(id, new CartItem(p, 1));
                    } else if (old.getQuantity() < p.getStock()) {
                        old.setQuantity(old.getQuantity() + 1);
                    }

                    session.setAttribute(
                            "notice", p.getName() + " added to your bag."
                    );
                } else {
                    session.setAttribute(
                            "error", "Product is unavailable or out of stock."
                    );
                }

            } else if ("remove".equals(action)) {

                cart.remove(Integer.parseInt(req.getParameter("id")));

            } else if ("update".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));
                CartItem item = cart.get(id);

                if (item != null) {
                    int quantity = Integer.parseInt(
                            req.getParameter("quantity")
                    );

                    int stock = item.getProduct().getStock();

                    if (stock > 0) {
                        quantity = Math.max(1, Math.min(stock, quantity));
                        item.setQuantity(quantity);
                    } else {
                        cart.remove(id);
                    }
                }
            }

        } catch (SQLException | NumberFormatException e) {
            session.setAttribute(
                    "error", "Could not update your bag. Please try again."
            );
        }

        String back = req.getParameter("back");

        res.sendRedirect(
                "cart".equals(back)
                        ? req.getContextPath() + "/cart"
                        : req.getContextPath() + "/products"
        );
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) req.getSession()
                        .getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
        }

        req.setAttribute("cartItems", cart.values());

        java.math.BigDecimal total = java.math.BigDecimal.ZERO;

        for (CartItem item : cart.values()) {
            total = total.add(item.getSubtotal());
        }

        req.setAttribute("cartTotal", total);

        req.getRequestDispatcher("/cart.jsp").forward(req, res);
    }
}
