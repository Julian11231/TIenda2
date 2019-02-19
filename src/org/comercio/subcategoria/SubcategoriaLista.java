package org.comercio.subcategoria;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="listing")

public class SubcategoriaLista {

	private List<Subcategoria> items;

	public SubcategoriaLista(){

	}

	public SubcategoriaLista(List<Subcategoria> items){

	this.items = items;

	}

	@XmlElement(name="data")

	public List<Subcategoria> getItems(){

	return items;

	}

	}

