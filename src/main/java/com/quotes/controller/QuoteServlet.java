package com.quotes.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quotes.dao.QuoteService;
import com.quotes.model.Quote;

@WebServlet("/quote")
public class QuoteServlet extends HttpServlet {
    private QuoteService quoteService;

    @Override
    public void init() throws ServletException {
        quoteService = new QuoteService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "random";
        }

        switch (action) {
            case "random":
                Quote randomQuote = quoteService.getRandomQuote();
                req.setAttribute("quote", randomQuote);
                req.getRequestDispatcher("/home.jsp").forward(req, resp);
                break;
            case "search":
                String author = req.getParameter("author");
                List<Quote> quotes = quoteService.getQuotesByAuthor(author);
                req.setAttribute("quotes", quotes);
                req.getRequestDispatcher("search.jsp").forward(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
}