package org.comercio.producto;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="listing")

public class DepartamentoLista {

private List<Departamento> items;

public DepartamentoLista(){

}

public DepartamentoLista(List<Departamento> items){

this.items = items;

}

@XmlElement(name="data")

public List<Departamento> getItems(){

return items;

}

}
