-- IT WORKS!! ARR!!

moon = require "moon"

export class combo
	new: (list,attrs) =>
		@set = list
		@attributes = attrs
	compare: (comparison) =>
		return false if #comparison ~= #@set
		table.sort(comparison)
		table.sort(@set)
		for i in pairs(comparison)
			return false if comparison[i]~=@set[i]
		return true

export findCombos = (collection) ->
	for i=#collection,2,-1 --obviously 1 atom can't be a molecule
		print i
		for a=1,#combos
			if #combos[a].set==i
				for b=1,(#collection-i)+1
					t = {}
					for c=0,i-1
						table.insert t,collection[b+c]
					isit = combos[a]\compare(t)
					if isit
						for q=1,#t
							print t[q],b+q-1 --where b+q-1 == position in collection[]

export combos = {combo({"H","Cl"},{"magic"}),combo({"O","Cl"},{"magic"}),combo({"H","O"},{"magic"})} --all the combos (THESE ONES ARE TEMPORARY)

--findCombos({"H","Cl","O"}) (exemplary use)

export class typing
	new: (text) => --a text containing what you want to print, using <tab> as a delay
		@letters = {}
		for letter in text\gmatch "%Z" --%Z = everything but a non-existant character
			if letter~="	"
				table.insert @letters,letter
			else
				table.insert @letters,""
		@position = 1
	text: (caret) => --display caret?
		str=""
		for i=1,@position
			str..=@letters[i]
		if not caret	
			return str
		return "#{str}█"
	inc: () =>
		if @position<#@letters
			@position+=1
			return true
		else
			return false