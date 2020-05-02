package aiss.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiss.model.resources.YoutubeResource;
import aiss.model.youtube.VideoSearch;
import aiss.model.edamam.EdamamSearch;
import aiss.model.edamam.Hit;
import aiss.model.edamam.Recipe;
import aiss.model.resources.EdamamResource;

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
		String recipe = request.getParameter("recipe");
		String uri = request.getParameter("uri");
		String queryDrive = request.getParameter("query");
		EdamamResource edamam = new EdamamResource();
		EdamamSearch resultados = edamam.getRecipes(query);
		RequestDispatcher rd = null;
		
		List<Recipe> lista = new ArrayList<>();
		for (Hit hit : resultados.getHits()) {
			lista.add(hit.getRecipe());
		}
		Map<String, Recipe> map = new HashMap<>();
		for (Recipe recipe2 : lista) {
			map.put(recipe2.getUri(), recipe2);
		}
		Recipe receta2 = map.get(uri);
		
		// Search for videos in YouTube
		log.log(Level.FINE, "Searching for Youtube videos that contain " + query);
		YoutubeResource youtube = new YoutubeResource();
		VideoSearch youtubeResults = youtube.getVideos(query);
		
		if (youtubeResults!=null) {
			request.setAttribute("name", query);
			request.setAttribute("recipe2", receta2);
			request.setAttribute("videos", youtubeResults.getItems());
			request.setAttribute("recipe", recipe);
			request.setAttribute("uri", uri);
			request.setAttribute("recetaIngredientes", map);
			request.setAttribute("query", queryDrive);
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
