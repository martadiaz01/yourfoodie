package aiss.model.resources;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.restlet.resource.ClientResource;

import aiss.model.edamam.EdamamSearch;

public class EdamamResource {

	// keys
	private static final String EDAMAM_APP_ID = "540b5b4e";
	private static final String EDAMAM_API_KEY = "03f6cd34cb3bd14529d39e856957b83a";
	private static final Logger log = Logger.getLogger(EdamamResource.class.getName());

	public EdamamSearch getRecipes(String query) throws UnsupportedEncodingException {

		String uri = "https://api.edamam.com/search?q=" + URLEncoder.encode(query, "UTF-8") + "&app_id=" + EDAMAM_APP_ID
				+ "&app_key=" + EDAMAM_API_KEY;
		log.log(Level.FINE, "URL:" + uri);

		ClientResource cr = new ClientResource(uri);
		EdamamSearch recipes = cr.get(EdamamSearch.class);

		return recipes;
	}
}
