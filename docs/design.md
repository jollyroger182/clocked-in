## Level ZIP

A complete level is a ZIP file with:

- `level.json`: Main level file (described below)
- `music.wav`: Music of the level
- any assets used by the level

This ZIP file will be unzipped to `user://level/` when the level is playing.

## Level JSON file

```jsonc
{
	"metadata": {
		"title": "Never Gonna Give You Up",
		"musician": "Rick Astley",
		"charter": "jolly",
		"cover_artist": "internet",
		
		// initial bpm of music
		"bpm": 100,
		// number of beats per bar (for editor only)
		"beats_per_bar": 4
	},
	// sorted by beat
	"events": [
		{
			"beat": 0.0,
			"type": "set_background",
			// name of the .tscn file in the ZIP to set as the background
			"scene": "bg.tscn",
			// (optional) script to attach to the scene
			"script": "bg.gd"
		},
		{
			"beat": 0.0,
			"type": "add_hand",
			// every how many beats does this hand move?
			"interval": 1.0,
			// how many ticks does the hand move in total? (not including spawn)
			"ticks": 7,
			// how many places does the hand move each time? (1-59)
			"stride": 5,
			// (optional) initial position of the hand (0-59)
			"initial": 0,
			// (optional) color of the hand
			"color": "#000000",
			// (optional) length of the hand as a fraction of the radius
			"length": 0.8
		},
		{
			"beat": 4.0,
			"type": "set_props",
			"bpm": 120,
			"beats_per_bar": 6
		},
		{
			"beat": 4.0,
			"type": "note",
			// position on the clock (0-59)
			"location": 30,
			// (optional) color for the effect
			"color": "#000000"
		}
	]
}
```

## Event types

- [ ] `set_background`
- [x] `add_hand` (handled in `hands.gd` when emitted)
- [ ] `set_props`
- [x] `note` (handled in `notes.gd` at startup)
