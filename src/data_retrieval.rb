#!/usr/bin/env ruby

require 'rubygems'
require 'excon'

def expectType(arrayOfTypes, object)
	for i in arrayOfTypes
		if object.instance_of? i
			return i
		end
	end

	return false
end

def search(searchTerm)
	searchTermType = expectType([String, Array], searchTerm)
	if searchTermType == Array
		

	dataSource = "https://www.reversewhois.io/?searchterm=" + searchTerm

	response = Excon.get(dataSource)

    if response.status != 200
      return "Error. Reversewhois.io did not return HTTP 200"
    end
	
	return response.body	
end
