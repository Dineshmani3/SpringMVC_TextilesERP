package com.mvc.model;

import java.util.ArrayList;
import java.util.List;
import org.springframework.util.AutoPopulatingList;
import org.apache.commons.collections4.FactoryUtils;
import org.apache.commons.collections4.list.LazyList;

public class InvoiceItemsArray {


	//private List<InvoiceItems> igs = new AutoPopulatingList<InvoiceItems>(InvoiceItems.class);
	private List<InvoiceItems> igs = LazyList.lazyList( new ArrayList<InvoiceItems>(), 
            FactoryUtils.instantiateFactory(InvoiceItems.class)); 
			//.decorate( new ArrayList<InvoiceItems>(), 
            //FactoryUtils.instantiateFactory(InvoiceItems.class)); 
	public List<InvoiceItems> getIgs() {
		return (List<InvoiceItems>) igs;
	}

	public void setIgs(List<InvoiceItems> igs) {
		this.igs = igs;
	}
	
}
