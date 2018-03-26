# Ambient samples from "Evening Side" by Four Tet: https://www.youtube.com/watch?v=kcn7sSfWRrg
# Vocal samples from Lata Mangeshkar: https://www.youtube.com/watch?v=4AHlO31g6eU
# BPM: https://songbpm.com/evening-four-tet?q=evening%20four%20tet
# G-Major: https://www.basicmusictheory.com/g-major-key-signature
use_bpm 120
phase1 = "~/Desktop/four_tet_evning_side_remix/samples/phase3.wav"
phase2 = "~/Desktop/four_tet_evning_side_remix/samples/phase2.wav"
phase3 = "~/Desktop/four_tet_evning_side_remix/samples/phase1.wav"
vocals = "~/Desktop/four_tet_evning_side_remix/samples/lata_mangeshkar_vocals.wav"
phasers = [phase1, phase2, phase3]
tab = :tabla_ghe1
t1 = 3
t2 = 0
x = 2
#not_g_major = [:f7, :g7, :a7, :es8, :f8, :g8, :a8, :es8]

define :play_vocals do
  sample vocals, attack: 10
end

define :play_melody do |a, b, c, d, e, f|
  play a
  play b
  sleep 3
  play c
  play d
  sleep 3
  play e
  play f
  sleep 3
  play :g2, sustain: 2
  play :g3
  play :g4
end

define :play_drums do
  sample tab, amp: 0.5
  sample :tabla_ghe2, amp: 0.25
  sleep 0.375
  sample :tabla_ghe6, amp: 0.5
  sleep 0.375
  sample tab, amp: 0.5
  sleep 1.5
  sample :tabla_te_ne, amp: 0.25
  sleep 0.75
end

#=begin
4.times do
  sample tab, amp: 0.5
  sample :tabla_ghe2, amp: 0.25
  sleep 3
end
2.times do
  play_drums
end
sample phase1, beat_stretch: 12, start: 0, finish: 0.55
2.times do
  play_drums
end
#=end

live_loop :phaser do
  i = rrand_i(0,2)
  sample phasers[i], amp: x
  sleep 6
end

live_loop :percussion do
  sync :phaser
  if t1 == 0
    stop
  else
    (6/t1).times do
      sample tab, amp: 0.5
      sample :tabla_ghe2, amp: 0.25
      sleep 0.125*t1
      sample :tabla_ghe6, amp: 0.5
      sleep 0.125*t1
      sample tab, amp: 0.5
      sleep 0.5*t1
      sample :tabla_te_ne, amp: 0.25
      sleep 0.25*t1
    end
  end
end

live_loop :alien_melody do
  use_synth :blade
  use_synth_defaults amp: 0.5, attack: 0.5, sustain: 0.5
  
  sync :phaser
  if t2 == 0
    stop
  elsif t2 == 1
    play_melody :g4, :g6, :b3, :b5, :d4, :d5
    sleep 15
  else
    play_melody :d4, :d5, :b3, :b4, :g4, :g5
    sleep 3
    play :g1
    play :g2, sustain: 2
    sleep 12
  end
end

#play_vocals

=begin
  print sample_duration phase1
  print sample_duration phase2
  print sample_duration phase3
=end