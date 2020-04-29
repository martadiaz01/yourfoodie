package aiss.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiss.model.resources.YoutubeResource;
import aiss.model.youtube.VideoSearch;

/**
 * Servlet implementation class SearchVideoController
 */
public class SearchVideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger log = Logger.getLogger(SearchController.class.getName());

	public SearchVideoController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String query = request.getParameter("label");
		RequestDispatcher rd = null;
		
		// Search for videos in YouTube
		log.log(Level.FINE, "Searching for Youtube videos that contain " + query);
		YoutubeResource youtube = new YoutubeResource();
		VideoSearch youtubeResults = youtube.getVideos(query);
		
		if (youtubeResults!=null) {
			request.setAttribute("videos", youtubeResults.getItems());
			rd = request.getRequestDispatcher("/successVideo.jsp");
		} else {
			log.log(Level.SEVERE, "YouTube object: " + youtubeResults);
			rd = request.getRequestDispatcher("/error.jsp");
		}
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}
}
