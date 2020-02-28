const effect = () => {
  const accept = document.getElementById('accept');

    accept.addEventListener("click", (event) => {
      event.preventDefault();
      console.log(accept);
      document.querySelector('.requests-card').style.box_shadow = '0 0 15px #230444';
    });

}

export { effect }
