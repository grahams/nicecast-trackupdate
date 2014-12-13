JsOsaDAS1.001.00bplist00�Vscript_�var iTunes = Application('iTunes');
iTunes.includeStandardAdditions = true;

while(1) {
	var track = getCurrentTrack();
	var str = createTrackString(track);

	str.writeToFileAtomically('/Users/grahams/Library/Application Support/Nicecast/NowPlaying.txt', true);
	
	delay(2);
}

/**
 * This method gathers info about the currently playing track in iTunes
 * and returns an object containing the info.
 */
function getCurrentTrack() {
	var track = null;
	var cT = iTunes.currentTrack;
	
	if(cT) {
		track = {};
		track["album"] = cT.album();
		track["artist"] = cT.artist();
		track["name"] = cT.name();
		track["time"] = cT.time();
	}
	
	return track
};

function createTrackString(track) {
	var output = null;
	
	if(track) {
		output = "";
		output += "Title: " + track["name"] + "\n";
		output += "Artist: " + track["artist"] + "\n";
		output += "Album: " + track["album"] + "\n";
		output += "Time: " + track["time"] + "\n";
	}

	return $.NSString.alloc.initWithUTF8String(output);
};
                              � jscr  ��ޭ