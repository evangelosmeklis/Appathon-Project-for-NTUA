function myFunction() {
  var x = document.getElementById("frm2");
  var title = x.elements[0].value;
  var site = x.elements[1].value;
  if (site == "Scholar") {
    window.open("http://scholar.google.com/scholar?q=" + title);
  } else if (site == "Pubmed") {
    window.open("https://pubmed.ncbi.nlm.nih.gov/?term=" + title);
  } else if (site == "Direct") {
    window.open("https://www.sciencedirect.com/search?qs=" + title);
  }
}
