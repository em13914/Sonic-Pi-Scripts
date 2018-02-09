# NAME OF SONG: Just Can't Get Enough by Depeche Mode
# SHEET MUSIC: http://fileserver.freehandmusic.netdna-cdn.com/preview/530x4/sonyatv/snycvjcge.png
# BPM USED: https://songbpm.com/just-can-t-get-enough?q=just%20can%27t%20get%20enough

use_bpm 128
use_synth :prophet
# this is the variable I am incrementing
x = 0
# this is the variable that controls which sample plays on lines 78, 80, and 82
my_sample = :drum_snare_soft


# main melody playing all by itself
3.times do
  play :g
  sleep 1
  play :g
  sleep 0.5
  2.times do
    play :g
    sleep 0.25
  end
  sleep 0.25
  play :g
  sleep 0.25
  play :g
  sleep 0.5
  play :a
  sleep 0.5
  play :b
  sleep 0.5
end
play :c
sleep 1
play :b
sleep 1
play :a
sleep 1
play :b
sleep 1

# melody comes in as a live_loop playing at the same time as the steadily increasing cymbal sound
live_loop :melody do
  with_fx :reverb do
    3.times do
      play :g
      sleep 1
      play :g
      sleep 0.5
      2.times do
        play :g
        sleep 0.25
      end
      sleep 0.25
      play :g
      sleep 0.25
      play :g
      sleep 0.5
      play :a
      sleep 0.5
      play :b
      sleep 0.5
    end
    play :c
    sleep 1
    play :b
    sleep 1
    play :a
    sleep 1
    play :b
    sleep 1
  end
end

# the variable x starts at 0 and slowly gets louder until the amplitude = 1 after 64 iterations
64.times do
  sample :drum_snare_hard, amp: x
  sleep 0.0625
  sample my_sample, amp: x
  sleep 0.0625
  sample my_sample, amp: x
  sleep 0.0625
  sample my_sample, amp: x
  sleep 0.0625
  x = x + 0.015625/2
end

# as soon as the snare builds up for 16 beats the :drums live_loop starts playing with the :melody live_loop
live_loop :drums do
  sample :loop_amen, beat_stretch: 2, rate: 0.5
  sleep 2
end
