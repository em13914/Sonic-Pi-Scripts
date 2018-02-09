# NAME OF SONG: Just Can't Get Enough by Depeche Mode
# SHEET MUSIC: http://fileserver.freehandmusic.netdna-cdn.com/preview/530x4/sonyatv/snycvjcge.png
# BPM USED: https://songbpm.com/just-can-t-get-enough?q=just%20can%27t%20get%20enough

use_bpm 128
use_synth :prophet

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

live_loop :drums do
  sample :loop_amen, beat_stretch: 2, rate: 0.5, amp: rrand(2, 3)
  sleep 2
end
