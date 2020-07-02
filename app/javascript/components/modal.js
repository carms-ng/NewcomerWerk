const loadModal = () => {

  const bookBtns = document.querySelectorAll('.btn-open-modal');

  const handleClick = () => {
    setTimeout(() => {
      const modal = document.querySelector('.modal__bg')
      modal.style.display = 'flex';
    }, 1000); 

    const closeBtn = modal.getElementById('closed');
    closeBtn.addEventListener('click', () => {
      modal.style.display = 'none';
    })
  }

  if (bookBtns) {
    bookBtns.forEach(btn => btn.addEventListener('click', handleClick));
  }
}    
      
export { loadModal };
