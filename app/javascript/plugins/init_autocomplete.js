import places from 'places.js';
    console.log("inside the file")

const initAutocomplete = () => {
  const addressInput = document.getElementsByClassName("office_address"); // !!!!!!!!
  console.log(addressInput)
  if (addressInput) {
    places({ container: addressInput[0] });
  }
};

export { initAutocomplete };
