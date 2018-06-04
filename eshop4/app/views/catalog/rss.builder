xml.instruct!
    xml.rss "version" => "2.0", "xmlns:dc" => 
    "http://purl.org/dc/elements/1.1/" do
        xml.channel do
            xml.title @page_title
            xml.description "Emporium: Liquors for people"
            xml.link url_for :action => 'index', :only_path => false
            xml.language "en-us"
            xml.ttl "60"
            for liquor in @liquors do
                xml.item do
                xml.title liquor.name
                xml.description "#{liquor.name} by #{liquor.supplier_names}"
                xml.link url_for :action => "show", :id => liquor, 
                :only_path => false
                xml.guid url_for :action => "show", :id => liquor, 
                :only_path => false
                xml.pubDate liquor.created_at.to_s :long
                xml.author liquor.supplier_names
            end
        end
    end
end