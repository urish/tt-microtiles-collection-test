all: logistic_snd.flac

.PHONY: all clean

# Resample logistic_snd.wav to a more normal rate
logistic_snd.flac: logistic_snd.wav
	sox -r 25200000 $< -b 16 -r 48000 $@

# Convert a simulation trace to a high-sample-rate audio file
logistic_snd.wav: target/release/fst2wav logistic_snd.fst
	fst2vcd logistic_snd.fst | sed -e 's/^[$$]var logic/$$var wire/' | target/release/fst2wav $@

target/release/fst2wav: Cargo.toml Cargo.lock src/main.rs
	cargo build --release

clean:
	rm -rf logistic_snd.flac logistic_snd.wav target/
