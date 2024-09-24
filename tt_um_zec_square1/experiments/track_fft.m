% Copyright (c) 2024 Zachary Catlin
% SPDX-License-Identifier: Apache-2.0

function track_fft (fname)
  duration = 180;         % length of track in seconds
  sample_rate = 48000;    % sample rate (Hz)
  fft_sz = 2048;          % size of IFFT; must be a power of 2

  freq_lo = 200;          % frequency range used is approx.
  freq_hi = 1200;         % [freq_lo, freq_hi] Hz

  lo_bin = floor(freq_lo * fft_sz / sample_rate) + 1;
  bin_range = floor((freq_hi - freq_lo) * fft_sz / sample_rate);

  n_ffts = floor(duration * sample_rate / fft_sz);
  samp = zeros(1, n_ffts * fft_sz);
  hist = zeros(1, fft_sz);

  x = 0.01;
  r = 1.0;
  for i = 1:n_ffts
    r = 1 + (2.995 * i / n_ffts);
    hist(:) = 0;

    for j = 1:fft_sz
      x = r * x * (1 - x);
      h_idx = lo_bin + floor(x * bin_range);
      hist(h_idx) = hist(h_idx) + 1;
    endfor
    s_idx = (i - 1) * fft_sz + 1;
    samp(s_idx:(s_idx + fft_sz - 1)) = real(ifft(hist));
  endfor

  summary = sprintf('track_fft %d %f %d %s', sample_rate, duration, fft_sz, fname);
  save -text -append 'log.txt' summary;

  audiowrite(fname, samp, sample_rate);
endfunction
