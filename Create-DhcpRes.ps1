# Define an array of hash tables, each representing a reservation
$dhcpServer = "dhcpserver.contoso.com"
$reservations = @(
	@{
		ScopeID         = "scope1";
		ReservationIP   = "192.168.1.100";
		ClientMAC       = "00-11-22-33-44-55";
		ReservationName = "ClientName1";
	},
	@{
		ScopeID         = "192.168.2.0";
		ReservationIP   = "192.168.2.100";
		ClientMAC       = "66-77-88-99-AA-BB";
		ReservationName = "ClientName2";
	}
	# Add more reservations as needed
)

# Process each reservation in the array
foreach ($reservation in $reservations) {
	Add-DhcpServerv4Reservation -ComputerName $DHCPserver `
		-ScopeId $reservation.ScopeID `
		-IPAddress $reservation.ReservationIP `
		-ClientId $reservation.ClientMAC `
		-Description "Reserved for $($reservation.ReservationName)"`
		-Name $reservation.ReservationName

	Write-Output "Reservation added successfully for IP: $($reservation.ReservationIP)"
}

Write-Output "All reservations processed."