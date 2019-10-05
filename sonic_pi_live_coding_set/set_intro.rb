duckworth_intro = "/C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/DUCKWORTH/set_intro.wav"
duration = sample_duration duckworth_intro
a = 1

#function definition
define :hiss do
  sample :vinyl_hiss
  sleep sample_duration :vinyl_hiss
end

#function call
hiss

live_loop :intro do
  hiss
end

sample duckworth_intro
sleep duration

4.times do
  sample duckworth_intro, start: 0.825, finish: 1, amp: a
  sleep (duration*0.175)
  a = a - 0.2
end