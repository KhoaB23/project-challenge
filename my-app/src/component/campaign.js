import React from "react";
import {
    useQuery, gql
  } from "@apollo/client";

  import {
    Table,
    Thead,
    Tbody,
    Tfoot,
    Tr,
    Th,
    Td,
    TableCaption,
  } from '@chakra-ui/react'

function Campaign(){
    const LIST_CAMPAIGNS = gql`
    {   allCampaigns {
            id 
            name 
            startDate 
            endDate
            budget
            hashtags
            description
        }
      }
    `;

    const {loading, error, data} = useQuery(LIST_CAMPAIGNS);
    console.log(data);
    if(loading) return <p>Loading,...</p>;
    if (error) return <p>Error: </p>

    return (
        <div>
            <Table variant='simple'>
                <TableCaption>Campaigns</TableCaption>
                <Thead>
                    <Tr>
                    <Th>Name</Th>
                    <Th>Start Date</Th>
                    <Th>End Date</Th>
                    <Th isNumeric>Budget</Th>
                    <Th>Hashtags</Th>
                    <Th>Description</Th>
                    </Tr>
                </Thead>
                <Tbody>
                    {data.allCampaigns.map(campaign => (
                        <Tr>
                        <Th>{campaign.name}</Th>
                        <Th>{campaign.startDate}</Th>
                        <Th>{campaign.endDate}</Th>
                        <Th isNumeric>{campaign.budget}</Th>
                        <Th>{campaign.hashtags}</Th>
                        <Th>{campaign.description}</Th>
                        </Tr>
                            ))}
                </Tbody>
                <Tfoot>
                    <Tr>
                    <Th>Name</Th>
                    <Th>Start Date</Th>
                    <Th>End Date</Th>
                    <Th isNumeric>Budget</Th>
                    <Th>Hashtags</Th>
                    <Th>Description</Th>
                    </Tr>
                </Tfoot>
            </Table>        
                    )
        </div>
    )
}
export default Campaign;