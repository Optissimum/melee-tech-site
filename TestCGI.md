---
title: Test CGI
---

# Test CGI

## Form

<form id="hello" action="/cgi-bin/hello" method="POST">
  <label for="fname">First name:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="lname">Last name:</label><br>
  <input type="text" id="lname" name="lname" value="Doe"><br><br>
  <input type="submit" value="Submit">
</form>

## Results

<div id="result"></div>

---

<script>
  document.addEventListener('DOMContentLoaded', function(event) {
    u("#hello").on("submit", function (e) {
      e.preventDefault();
      
      const data = new FormData(u("#hello").first());

      var object = {};
      data.forEach(function(value, key){
        object[key] = value;
      });
      var json = JSON.stringify(object);

      fetch("/cgi-bin/hello", {
        method: "POST",
        body: json,
      }).then(function (res) {
        if (res.ok) {
          res.text().then(function (text) {
            u("#result").text(text);
          })
        } else {
          u("#result").text(res.statusText)
        }
      });
    });
  });
</script>