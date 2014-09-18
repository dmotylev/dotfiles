// Displays

var monLaptop = S.screenForRef("1440x900");
var monDell = S.screenForRef("2560x1080");

// Generic ops
var leftHalf = S.op("push", {
	"direction" : "left",
	"style" : "bar-resize:screenSizeX/2"
});
var rightHalf = S.op("push", {
	"direction" : "right",
	"style" : "bar-resize:screenSizeX/2"
});
var centerLeft = S.op("push", {
	"direction" : "left",
	"style" : "center"
});
var centerRight = S.op("push", {
	"direction" : "right",
	"style" : "center" 
});
var centerUp = S.op("push", {
	"direction" : "up",
	"style" : "center"
});
var centerDown = S.op("push", {
	"direction" : "down",
	"style" : "center"
});
var thirdOfScreen = S.op("move", {
	"x" : "windowTopLeftX",
	"y" : "windowTopLeftY",
	"width" : "screenSizeX/3",
	"height" : "screenSizeY"
});


// Throw ops
var toggleScreen = function(win) {
	var cScreen = win.screen();
	var nScreen = S.screenForRef(cScreen.id()+1 === S.screenCount()? 0 : cScreen.id() + 1);
	var cRect = cScreen.visibleRect();
	var nRect = nScreen.visibleRect();

	var p = win.topLeft();
	var nX = Math.round((p.x-cRect.x)/cRect.width*nRect.width);
	var nY = Math.round((p.y-cRect.y)/cRect.height*nRect.height);
	var s = win.size();
	var nW = Math.round(s.width/cRect.width*nRect.width);
	var nH = Math.round(s.height/cRect.height*nRect.height);

	win.doOperation("throw", {
		"x" : nRect.x + nX,
		"y" : nRect.y + nY,
		"width" : nW,
		"height" : nH,
		"screen": nScreen.id()
	});
};

// Fullscreen ops
var maximize = S.op("move", {
	"x" : "screenOriginX",
	"y" : "screenOriginY",
	"width" : "screenSizeX",
	"height" : "screenSizeY"
});
var fullscreen = function (win) {
	win.doOperation(S.operation("shell", {
		"command" : "/usr/bin/osascript fullscreen.scpt "+win.app().name(),
		"wait" : true,
		"path" : "~/.dotfiles/bin"
	}));
};
var laptopFullscreen = function (win) {
	win.doOperation("throw",{"screen":monLaptop});
	win.doOperation(S.operation("shell", {
		"command" : "/usr/bin/osascript fullscreen.scpt "+win.app().name()+" true",
		"wait" : true,
		"path" : "~/.dotfiles/bin"
	}));
};

// Binding on events
S.on("windowOpened", function(event,win) {
	if(win.app().name() === "HipChat" && win.isMain()) {
		laptopFullscreen(win);
	}
	if(win.app().name() === "Skype" && win.isMain()) {
		laptopFullscreen(win);
	}
});

// Binding on keystrokes
S.bnda({
	"z:cmd,`" : S.op("undo"),
	"[:cmd,`" : leftHalf,
	"]:cmd,`" : rightHalf,
	"left:cmd,`" : centerLeft,
	"right:cmd,`" : centerRight,
	"up:cmd,`" : centerUp,
	"down:cmd,`" : centerDown,
	"=:cmd,`" : maximize,
	"=:alt,cmd,`" : fullscreen,
	"space:cmd,`" : toggleScreen,
	"3:cmd,`" : thirdOfScreen
});

