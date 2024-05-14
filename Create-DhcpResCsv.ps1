# CSV File Sample
## ScopeID, ReservationIP, ClientMAC, ReservationName
## "192.168.1.0", "192.168.1.100", "00-11-22-33-44-55", "ClientName1"
## "192.168.2.0", "192.168.2.100", "66-77-88-99-AA-BB", "ClientName2"
# Define the DHCP server
$dhcpServer = "dhcpserver.contoso.com"

# Read reservations from a CSV file
$reservations = Import-Csv -Path "reservations.csv"

# Process each reservation in the array
foreach ($reservation in $reservations) {
	Add-DhcpServerv4Reservation -ComputerName $dhcpServer `
		-ScopeId $reservation.ScopeID `
		-IPAddress $reservation.ReservationIP `
		-ClientId $reservation.ClientMAC `
		-Description "Reserved for $($reservation.ReservationName)" `
		-Name $reservation.ReservationName

	Write-Output "Reservation added successfully for IP: $($reservation.ReservationIP)"
}

Write-Output "All reservations processed."