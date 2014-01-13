Our project for Music Hack Day NYC 2013

This system allows many users to connect their iPhones to a jam session managed by a Python Flask server. The tune and sound of the note can be controlled by dragging a finger on the screen (and by adjusting other sliders, for example for controlling the filter's cutoff frequency).

The sound is emitted by a central sound source (i.e. a computer) where a web page constantly receives the notes' metadata from the server and synthetizes them thanks to the Web Audio's API synthesis capabilities.
