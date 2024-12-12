    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%= stylesheet_link_tag "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" %>
    <%= stylesheet_link_tag "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"  %>
    <%= stylesheet_link_tag "https://cdn.simplecss.org/simple.css"  %>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>    





  .modal {
    position: fixed;
    z-index: 1;
    padding: 2em;
    
    /* Centering */
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);

    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
    /* Add the drop shadow */
    box-shadow: 0 0 10px 0 rgba(0,0,0,0.2), 0 5px 10px 0 rgba(0,0,0,0.19);
}

.cancel-button {
    background-color: #1530ff;
    font-size: 12px;
    color: white;
    padding: 4px 8px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
    text-decoration: none;
}
.cancel-button:hover {
    background-color: #2640fe;
}     