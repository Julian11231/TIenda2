package org.comercio.categoria;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="listing")

public class CategoriaLista {
	
	private List<Categoria> items;

	public CategoriaLista(){

	}

	public CategoriaLista(List<Categoria> items){

	this.items = items;

	}

	@XmlElement(name="data")

	public List<Categoria> getItems(){

	return items;

	}

	}
