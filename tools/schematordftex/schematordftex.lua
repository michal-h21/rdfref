#!/usr/bin/env texlua
dofile("xml.lua")
dofile("handler.lua")
dofile('pretty.lua')
filename = nil
if #arg>0 then 
  filename=arg[#arg]
end
print(filename)
if filename then
  xmlfile = io.open(filename)
  if xmlfile then
    xml=xmlfile:read("*a")
  else
    error(e)
  end
else
  xml=io.read("*a")
end

h = simpleTreeHandler()
x = xmlParser(h)
x:parse(xml)
print("Delka ss "..#h.root["rdf:RDF"]["rdfs:Class"])
--local types={"rdfs:Class"=1,"rdf:Property"=1}
for k,v in pairs(h.root["rdf:RDF"]["rdfs:Class"]) do
   print(k .." : ")
   for m,n in pairs(v) do
    --- if m=="rdfs:Class" or m=="rdf:Property" then
       print(m)
    -- end
   end
end
