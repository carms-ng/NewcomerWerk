const bookingDiv = document.querySelector('.service-booking');
const serviceImg = document.querySelector('.service-img');
const fixDiv = () => {
  if (bookingDiv) {
    window.addEventListener('scroll', () => {
      const serviceContent = (serviceImg.innerheight / 100) * window.innerHeight
      console.log(serviceContent);
      // if (window.scrollY >= serviceContent) {
      //   navbar.classList.add('navbar-purple');
      // } else {
      //   navbar.classList.remove('navbar-purple');
      // }
  });
}

export { fixDiv };
