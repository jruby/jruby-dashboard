SCHEDULER.every '1s' do
  send_event('exceptions', current: $jruby_runtime.exception_count)
  send_event('callers', current: $jruby_runtime.caller_count)
end


