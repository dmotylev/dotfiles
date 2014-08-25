// Displays

var dInt = "1440x900";
var dExtW = "2560x1080";

// Operations

var rightExt = S.operation("push", {
	"direction" : "right",
	"style" : "bar-resize:screenSizeX/3",
	"screen" : dExtW
});
var leftExt = S.operation("push", {
	"direction" : "left",
	"style" : "bar-resize:screenSizeX/3",
	"screen" : dExtW
});
var middleExt = S.operation("move", {
	"x" : "screenOriginX+screenSizeX/3+1",
	"y" : "screenOriginY",
	"width" : "screenSizeX/3",
	"height" : "screenSizeY",
	"screen" : dExtW
});
var fullscreenInt = S.operation("move", {
	"x" : "screenOriginX",
	"y" : "screenOriginY",
	"width" : "screenSizeX",
	"height" : "screenSizeY",
	"screen" : dInt
});
var enableFullscreen = _.once(function (win) {
	win.doOperation(fullscreenInt);
	win.doOperation(S.operation("shell", {
		"command" : "/usr/bin/osascript fullscreen.scpt "+win.app().name()+" true",
		"wait" : true,
		"path" : "~/.dotfiles/bin"
	}));
});
var centerExt = S.operation("move", {
	"x" : "screenOriginX+(screenSizeX-1280)/2",
	"y" : "screenOriginY",
	"width" : "1280",
	"height" : "screenSizeY",
	"screen" : dExtW
});
var middleRightExt = S.operation("push", {
	"direction" : "right",
	"style" : "bar-resize:(screenSizeX/3)*2",
	"screen" : dExtW
});
var left = S.operation("push", {
	"direction" : "left",
	"style" : "bar-resize:screenSizeX/2"
});
var right = S.operation("push", {
	"direction" : "right",
	"style" : "bar-resize:screenSizeX/2"
});

// Binding on keystrokes

S.bind("c:ctrl,`", function(win) {
    win.doOperation(centerExt);
});

S.bind("1:ctrl,`", function(win) {
    win.doOperation(leftExt);
});

S.bind("2:ctrl,`", function(win) {
    win.doOperation(middleExt);
});

S.bind("3:ctrl,`", function(win) {
    win.doOperation(rightExt);
});

S.bind("4:ctrl,`", function(win) {
    win.doOperation(fullscreenInt);
});

S.bind("5:ctrl,`", function(win) {
    win.doOperation(middleRightExt);
});

S.bind("[:ctrl,`", function(win) {
    win.doOperation(left);
});

S.bind("]:ctrl,`", function(win) {
    win.doOperation(right);
});

// Binding on events

S.on("windowOpened", function(event,win) {
	if(win.app().name() === "HipChat") {
		enableFullscreen(win);
	}
	if(win.app().name() === "Skype") {
		enableFullscreen(win);
	}
});
