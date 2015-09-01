package com.springtuttor.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.springtuttor.model.Movie;

@Controller
@RequestMapping("/movies")
public class MyController {
	
	private static final String URL_OMDB = "http://www.omdbapi.com?";
	
	private RestTemplate restTemplate;
	
	@RequestMapping(method=RequestMethod.POST)
	public String getMovie(@RequestParam("title") String title,@RequestParam("year") String year,
			Model model){
		String url = URL_OMDB + "t=" + title + "&y=" + year + "&plot=short&r=json";
		Movie movie = restTemplate.getForObject(url, Movie.class);
		model.addAttribute("searchResult", movie);
		return "index";
	}
	
	@Autowired
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
}
