// This animates the modal to confirm booking request sent.
// Two booking forms, one for sm and one for other screen size.

const loadModal = () => {

  const bookBtns = document.querySelectorAll('.btn-open-modal');
  
  const handleClick = () => {
    const modal = document.querySelector('.modal__bg')
    
    // Dirty fix. Redirected to sign in page if user isn't logged in.
    setTimeout(() => {
      modal.style.display = 'flex';
    }, 1000); 

    // add event listener to close the button
    const closeBtn = modal.querySelector('#closed');
    closeBtn.addEventListener('click', () => {
      modal.style.display = 'none';
      // reload the page to clear the form
      location.reload();
    })
  }

  if (bookBtns) {
    bookBtns.forEach(btn => btn.addEventListener('click', handleClick));
  }
}    
      
export { loadModal };
