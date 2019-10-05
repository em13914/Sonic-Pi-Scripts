splash = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Emoji A Chain/splash.wav"
splash2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Emoji A Chain/splash_2.wav"
migos = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Emoji A Chain/migos.wav"
emoji = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Emoji A Chain/emoji_long.wav"
splash_wait = sample_duration splash

# DEFINE your function...
define :migos do |sample1, sample2, sample3|
  sample sample1
  sleep 2.5
  sample sample2
  sleep splash_wait
  sample sample3
  sleep (1-splash_wait)
end

live_loop :main do
  sample emoji, beat_stretch: 3.5, amp: 0.5
  sleep 3.5
end

# CALL your function!
live_loop :samples do
  migos migos, splash, splash2
end




