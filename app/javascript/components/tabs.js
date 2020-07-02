const tabBtns = Array.from(document.querySelectorAll('.tabs button'));
const tabPanels = Array.from(document.querySelectorAll('.tab-panel'));

const openPanel = (e) => {
  const i = tabBtns.indexOf(e.target);

  tabBtns.forEach(btn => btn.classList.remove('active'))
  tabPanels.forEach(panel => panel.classList.remove('active'))

  tabBtns[i].classList.add('active');
  tabPanels[i].classList.add('active');

}

const initTabs = () => {
  if (tabBtns) {
    tabBtns.forEach(btn => {
      btn.addEventListener('click', openPanel)
    });
  }
}

export { initTabs };
