package com.quotes.dao;

import com.quotes.model.Quote;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class QuoteService {
    private List<Quote> quotes;

    public QuoteService() {
        quotes = fetchQuotesFromApi();
    }

    private List<Quote> fetchQuotesFromApi() {
        List<Quote> quotesList = new ArrayList<>();
        try {
            HttpRequest request = HttpRequest.newBuilder()
                                             .GET()
                                             .uri(URI.create("https://type.fit/api/quotes"))
                                             .build();

            HttpClient client = HttpClient.newBuilder().build();
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            String jsonResponse = response.body();

            // Parse JSON response
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, String>> apiQuotes = objectMapper.readValue(jsonResponse, new TypeReference<List<Map<String, String>>>() {});

            
            for (Map<String, String> apiQuote : apiQuotes) {
//            	System.out.println(apiQuote.get("author"));
//            	System.out.println(apiQuote.get("text"));
                String author = apiQuote.get("author");
                String text = apiQuote.get("text");
                if (author != null && text != null) {
                		
                	author = author.replace(", type.fit", "");
                    text = text.replace("type.fit", "").trim();
//                    System.out.println(author+ " "+text);
                    quotesList.add(new Quote(author, text));
                }
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return quotesList;
    }

    public Quote getRandomQuote() {
        return quotes.get((int) (Math.random() * quotes.size()));
    }

    public List<Quote> getQuotesByAuthor(String author) {
        List<Quote> result = new ArrayList<>();
        for (Quote quote : quotes) {
            if (quote.getAuthor().equalsIgnoreCase(author)) {
                result.add(quote);
            }
        }
        return result;
    }
}
