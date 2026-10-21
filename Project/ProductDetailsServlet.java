package com.shopsphere.controller;

import com.shopsphere.dao.ProductDAO;
import com.shopsphere.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/product")
public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Product product = new ProductDAO().findById(id);

            if (product == null) {
                response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Product not found"
                );
                return;
            }

            request.setAttribute("product", product);

            request.getRequestDispatcher("/product-details.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid product id"
            );

        } catch (SQLException e) {
            throw new ServletException(
                "Could not load product details", e
            );
        }
    }
}