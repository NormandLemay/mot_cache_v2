module GrillesHelper

  def valide_mot_cache(reponse)
    lexique = Lexique.find_by(:first, :conditions => "id = #{@grilles.mot_cache}")
    if reponse == lexique.mot
      return 'Oui'
    else
      return 'Non'
    end
  end

  def afficher_liste_mots
    liste = Lexique.obtenir_liste_mot(@grille.listes_mots)
    result =""
    liste.each_slice(liste.count()/3)do |mots|
      result +="<div id='right'>"
      mots.each do |mot|
        result +="<span class='vide' onclick='cSwap(this)'>#{mot}</span><br>"
      end
      result += "</div>"
    end
    result.html_safe
  end

  def afficher_grille
    result =""
    result += "<table border='1'>"
    (0...@grille.y).each do |y|
      result += "<tr>"
      (0...@grille.x).each do |x|
        result+="<td class='vide' width='20' align='center' height='20' onclick='cSwap(this);'>#{@grille.get_val_x_y(x,y).upcase}</td>"
      end
      result+="</tr>"
    end
    result +="</table>"
    result.html_safe
  end
  def link_to_destroy(name, url, fallback_url)
    link_to_function name, "confirm_destroy(this, '#{url}')", :href => fallback_url
  end

end
