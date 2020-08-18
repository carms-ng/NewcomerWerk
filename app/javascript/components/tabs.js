// This animates the tab display for reviews(services#show & users#show) and bookings(bookings#index)

const tabBtns = Array.from(document.querySelectorAll('.tabs button'));
const tabPanels = Array.from(document.querySelectorAll('.tab-panel'));

// This function handles the click.
const openPanel = (e) => {
  const i = tabBtns.indexOf(e.target);

  // remove all class "active"
  tabBtns.forEach(btn => btn.classList.remove('active'))
  tabPanels.forEach(panel => panel.classList.remove('active'))

  // add class "active" to selected
  tabBtns[i].classList.add('active');
  tabPanels[i].classList.add('active');

}

// This function is exported to application.js
const initTabs = () => {
  if (tabBtns) {
    tabBtns.forEach(btn => {
      btn.addEventListener('click', openPanel)
    });
  }
}

export { initTabs };
