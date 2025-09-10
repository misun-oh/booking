fetch('../edu/header.jsp')
       .then(response => response.text())
       .then(data => {
           document.getElementById('header-p').innerHTML = data;
       });