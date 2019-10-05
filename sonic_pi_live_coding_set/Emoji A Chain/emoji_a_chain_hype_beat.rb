splash = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/emoji_a_chain/splash.wav"
splash2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/emoji_a_chain/splash_2.wav"
migos = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/emoji_a_chain/migos.wav"

wait = sample_duration splash
wait2 = sample_duration splash2


live_loop :migos do
  sleep 0.5
  sample splash
  sleep wait
  sample splash2
  sleep wait2
  sleep (3.20 - wait - wait2)
  sample migos
  sleep 0.30
end

live_loop :drums do
  sample :drum_cymbal_closed, rate: -1
  sample :bd_boom, amp: 0.25
  sleep 1
  sample :drum_splash_soft, rate: -1
  sleep 1
  sample :bd_boom, amp: 0.25
  sleep 2
end