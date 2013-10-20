window.AudioContext = window.AudioContext||window.webkitAudioContext;
var crazyLoop = undefined;
context = new AudioContext();

var instruments = {};

var getInstruments = function(){
	$.get('http://localhost:5000/instruments/',function(data){
		data = JSON.parse(data);
		for(name in data){
			if(instruments[name] == undefined){
				instruments[name] = new instrument(context, data[name]);
			}else{
				instruments[name].update(data[name]);
			}
		}
		
	});
};

var playInstruments = function(){
	var f = 220;
	for(name in instruments){
		instruments[name].playNote(f);
		f=f*2;
	}
};

var instrument = function(context, data){
	//OSC
	this.oscillator = context.createOscillator();
	this.filterNode = context.createBiquadFilter();
	//OSC -> FILTER
	this.gainNode                   = context.createGainNode();
	this.oscillator.connect(this.gainNode);
	this.filterNode.type            = this.filterNode.LOWPASS; // filter.type = 'lowpass';
	this.filterNode.frequency.value = 1000;
	this.filterNode.Q.value         = 3;

	//FILTER -> GAIN
	//this.filterNode.connect(this.gainNode);
    this.gainNode.gain.value = 5;
	this.gainNode.connect(context.destination);
	this.name                = data["user"];
	console.log(this.name+" just joined the jam session");
	
	this.update = function(data){
		this.pitch     = data["pitch"];
		this.filter    = data["filter"];
		this.gain      = data["gain"];
		this.wave      = data["wave"];
		this.resonance = data["q"];
	};
	
	this.update(data);
	
	this.playNote = function(){
	  // Play a sine type curve at A4 frequency (440hz).
	  console.log(this.name+" is playing note "+this.pitch+" at gain "+this.gainNode.gain.value+" with filter on "+this.filterNode.frequency.value+" with waveform "+this.oscillator.type);
	  this.filterNode.frequency.value = this.filter;
	  this.filterNode.Q.value         = this.resonance;
	  
	  this.oscillator.frequency.value = this.pitch;
	  this.oscillator.type = parseInt(this.wave);
	  this.gainNode.gain.value = this.gain;
	  this.oscillator.start(0);
	};
	
};


$(function(){
	crazyLoop = self.setInterval(function(){
			getInstruments();
			playInstruments();				
		},10);
	
	$("#stop").click(function(){
		window.clearInterval(crazyLoop);
	});
});

