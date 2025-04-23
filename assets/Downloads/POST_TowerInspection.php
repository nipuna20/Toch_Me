<?php
// Include the config.php file for database connection
require_once 'config.php';

// Retrieve data from Flutter app

$lightningAirTerminal = $_POST['lightningAirTerminal'];
$downConductor = $_POST['downConductor'];
$cableSheaths = $_POST['cableSheaths'];
$externalEarthBar = $_POST['externalEarthBar'];
$equipmentCabinet = $_POST['equipmentCabinet'];
$continuity = $_POST['continuity'];
$spdEarth = $_POST['spdEarth'];
$overCurrentProtection = $_POST['overCurrentProtection'];
$maintainability = $_POST['maintainability'];
$installation = $_POST['installation'];
$remarks = $_POST['remarks'];
$fuseBreakerAvailable = $_POST['fuseBreakerAvailable'];
$spdAvailable = $_POST['spdAvailable'];
$cableAvailable = $_POST['cableAvailable'];
$fuseBreakerRating = $_POST['fuseBreakerRating'];
$spdClass = $_POST['spdClass'];
$uoPhase = $_POST['uoPhase'];
$upPhase = $_POST['upPhase'];
$iImpPhase = $_POST['iImpPhase'];
$earthCableLength = $_POST['earthCableLength'];
$earthCableSize = $_POST['earthCableSize'];
$material_1 = $_POST['material_1'];
$thickness_1 = $_POST['thickness_1'];
$cross_section_1 = $_POST['cross_section_1'];
$material_2 = $_POST['material_2'];
$thickness_2 = $_POST['thickness_2'];
$cross_section_2 = $_POST['cross_section_2'];
$material_3 = $_POST['material_3'];
$thickness_3 = $_POST['thickness_3'];
$cross_section_3 = $_POST['cross_section_3'];
$direction_ = $_POST['direction_'];
$resistance_ = $_POST['resistance_'];
$average_resistance = $_POST['average_resistance'];



// SQL query to insert data into the database
$insertSql = "INSERT INTO TowerInspection (lightningAirTerminal, downConductor, cableSheaths, externalEarthBar, equipmentCabinet, continuity, spdEarth, overCurrentProtection, maintainability, installation, remarks, fuseBreakerAvailable, spdAvailable, cableAvailable, fuseBreakerRating, spdClass, uoPhase, upPhase, iImpPhase, earthCableLength, earthCableSize, material_1, thickness_1, cross_section_1, material_2, thickness_2, cross_section_2, material_3, thickness_3, cross_section_3, direction_, resistance_, average_resistance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

// Prepare the SQL statement
$stmt = $con->prepare($insertSql);

// Bind the parameters with the values
$stmt->bind_param("ssssssssssssssssssssssssssssssssssssssss", $lightningAirTerminal, $downConductor, $cableSheaths, $externalEarthBar, $equipmentCabinet, $continuity, $spdEarth, $overCurrentProtection, $maintainability, $installation, $remarks, $fuseBreakerAvailable, $spdAvailable, $cableAvailable, $fuseBreakerRating, $spdClass, $uoPhase, $upPhase, $iImpPhase, $earthCableLength, $earthCableSize, $material_1, $thickness_1, $cross_section_1, $material_2, $thickness_2, $cross_section_2, $material_3, $thickness_3, $cross_section_3, $direction_, $resistance_, $average_resistance);

    // Execute the prepared statement
    if ($stmt->execute()) {
        $lastInsertedID = $con->insert_id;
	echo "$lastInsertedID";
    } else {
        // Error message
        echo "Error inserting data: " . $stmt->error;
    }

// Close the prepared statement
$stmt->close();

// Close the database connection
$con->close();
?>
