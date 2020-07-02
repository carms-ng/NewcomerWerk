const loadModal = () => {

  const bookBtn = document.getElementById('book-now')

  if (bookBtn) {
    bookBtn.addEventListener("click", (event) => {
      setTimeout(() => {
        document.querySelector('.bg-modal').style.display = 'flex';
      }
      , 1000); 
    });

    document.getElementById('closed').addEventListener('click', (event) => {
      // event.preventDefault();
      document.querySelector('.bg-modal').style.display = 'none';
    });
  };
}

export { loadModal }
