package com.shopsphere.controller;
import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.IOException;
@WebServlet("/order-success")
public class OrderSuccessServlet extends HttpServlet {protected void doGet(HttpServletRequest q,HttpServletResponse p)throws ServletException,IOException{q.getRequestDispatcher("/order-success.jsp").forward(q,p);}}
