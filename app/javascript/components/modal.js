const loadModal = () => {

  const bookBtns = document.querySelectorAll('.btn-open-modal');
  
  const handleClick = () => {
    const modal = document.querySelector('.modal__bg')
    
    setTimeout(() => {
      modal.style.display = 'flex';
    }, 1000); 

    const closeBtn = modal.querySelector('#closed');
    closeBtn.addEventListener('click', () => {
      modal.style.display = 'none';
      location.reload();
    })
  }

  if (bookBtns) {
    bookBtns.forEach(btn => btn.addEventListener('click', handleClick));
  }
}    
      
export { loadModal };
