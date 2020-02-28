import "bootstrap";

// Mapbox Code
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// Autocomplete :

import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete()

import "../plugins/flatpickr";
