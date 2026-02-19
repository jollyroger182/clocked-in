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
		// number of beats per bar
		"beats_per_bar": 4
	},
	"events": [
		{
			"bar": 1,
			"beat": 1,
			"type": "add_hand",
			// every how many beats does this hand move?
			"tick": 1,
			// how many ticks does the hand move in total? (not including spawn)
			"ticks": 7,
			// how many places does the hand move each time? (1-60)
			"stride": 5,
		}
	]
}
```
