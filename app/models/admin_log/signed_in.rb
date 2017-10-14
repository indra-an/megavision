class SignedIn < AdminLog

  def self.to_json_api(admin)
    {
      current_sign_in_at: admin.current_sign_in_at,
      last_sign_in_at: admin.last_sign_in_at,
      current_sign_in_ip: admin.current_sign_in_ip,
      last_sign_in_ip: admin.last_sign_in_ip
    }
  end
end
