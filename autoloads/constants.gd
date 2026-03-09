extends Node

const CLOCK_RADIUS = 250

const TIERS = [
	{ "name": "Perfect", "threshold": 0.060, "score": 1.0, "color": "#f4e56a" },
	{ "name": "Good", "threshold": 0.100, "score": 0.6, "color": "#4a9eba" },
	{ "name": "Bad", "threshold": 0.160, "score": 0.0, "color": "#c97a27" }
]

const MISS_TIER = { "name": "Miss", "threshold": 1e9, "score": 0.0, "color": "#8b3a3a" }
